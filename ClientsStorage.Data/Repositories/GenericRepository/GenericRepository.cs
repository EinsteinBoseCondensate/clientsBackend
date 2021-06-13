using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Data.Repositories.GenericRepository
{
    /// <summary>
    /// Generic repository for basic EF labours
    /// </summary>
    /// <typeparam name="T">DbContext associated to repository</typeparam>
    /// <typeparam name="TEntity">Entity within related DbContext</typeparam>
    public abstract class GenericRepository<T, TEntity> : IGenericRepository<T, TEntity> where T : DbContext, new() where TEntity : class
    {

        #region Private fields
        private string Name => GetType().Name;
        private T Context { get; set; }
        private DbSet<TEntity> Set { get; set; }
        private bool disposed { get; set; } = false;
        private bool contextDisposed { get; set; } = false;

        private ILogger Logger;
        #endregion

        #region Constructors
        public GenericRepository(ILogger<TEntity> logger, IConfiguration configuration)
        {
            Logger = logger ?? throw new NullReferenceException("No ILoggerProvider implementation registered...");
            Context = new T();
            Set = Context.Set<TEntity>();
            
        }
        public GenericRepository(T Context, ILogger<TEntity> logger, IConfiguration configuration)
        {
            Logger = logger ?? throw new NullReferenceException("No ILoggerProvider implementation registered...");
            this.Context = Context;
            Set = Context.Set<TEntity>();
        }

        #region Private methods

        #endregion

        #endregion

        #region EF Methods
        public void AttachEntries(ICollection<TEntity> entries) => Set.AttachRange(entries.AsEnumerable());
        public void AttachEntry(TEntity entry) => Set.Attach(entry);
        /// <summary>
        /// Mark entries to be inserted in database
        /// </summary>
        /// <param name="entries">The entries to insert</param>
        public void InsertEntries(ICollection<TEntity> entries) => Set.AddRange(entries.AsEnumerable());
        /// <summary>
        /// Mark entry to be inserted in database
        /// </summary>
        /// <param name="entry">The entry to insert</param>
        public void InsertEntry(TEntity entry) => Set.Add(entry);
        /// <summary>
        /// Mark entries to be updated in database
        /// </summary>
        /// <param name="entries">The entries to update</param>
        public void UpdateEntries(ICollection<TEntity> entries) => Set.UpdateRange(entries.AsEnumerable());
        /// <summary>
        /// Mark entry to be updated in database
        /// </summary>
        /// <param name="entry">The entry to update</param>
        public void UpdateEntry(TEntity entry) => Set.Update(entry);
        /// <summary>
        /// Mark entries to be removed from database
        /// </summary>
        /// <param name="entries">The entries to be removed from database</param>
        public void RemoveEntries(ICollection<TEntity> entries) => Set.RemoveRange(entries.AsEnumerable());
        /// <summary>
        /// Mark entry to be removed from database
        /// </summary>
        /// <param name="entry">The entry to be removed from database</param>
        public void RemoveEntry(TEntity entry) => Set.Remove(entry);
        /// <summary>
        /// Mark entries as detached from EF tracking layer
        /// </summary>
        /// <param name="entries">The entries to be detached from EF tracking layer</param>
        public void DetachEntries(ICollection<TEntity> entries) => entries.ToList().ForEach(entry => DetachEntry(entry));
        /// <summary>
        /// Mark entry as detached from EF tracking layer
        /// </summary>
        /// <param name="entry">The entry to be detached from EF tracking layer</param>
        public void DetachEntry(TEntity entry) => Context.Entry(entry).State = EntityState.Detached;
        /// <summary>
        /// Get first result from linq query sentence async
        /// </summary>
        /// <param name="predicate">Linq query sentence</param>
        /// <returns>Task which gives a single instance of related entity type as result</returns>
        public async Task<TEntity> GetFirstOrDefaultBy(Expression<Func<TEntity, bool>> predicate) => await Set.FirstOrDefaultAsync(predicate);
        /// <summary>
        /// Get specified select fields from first result by linq query sentence async
        /// </summary>
        /// <param name="predicate">Linq query sentence</param>
        /// <returns>Task which gives a single instance of related entity type as result</returns>
        public async Task<Kobject> GetFirstOrDefaultByOnlyWith<Kobject>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, Kobject>> select)
            => await SetQuery(predicate).Select(select).FirstOrDefaultAsync();
        /// <summary>
        /// Gets boolean result from linq query sentence async
        /// </summary>
        /// <param name="predicate">Linq query sentence</param>
        /// <returns>boolean related to predicate parameter</returns>
        public async Task<bool> AnyAsync(Expression<Func<TEntity, bool>> predicate) => await Set.AnyAsync(predicate);
        /// <summary>
        /// Get all results from linq query sentence
        /// </summary>
        /// <param name="predicate">Linq query sentence</param>
        /// <returns>Task which gives a collection of related entity type as result</returns>
        public async Task<ICollection<TEntity>> GetManyBy(Expression<Func<TEntity, bool>> predicate) => await SetQuery(predicate).ToListAsync();
        public IQueryable<TEntity> SetSkippedAndCappedQueryable(Expression<Func<TEntity, bool>> predicate, int skippedIndex = 0, int topResults = 0) => SetQuery(predicate).Skip(skippedIndex).Take(topResults);
        public async Task<ICollection<TEntity>> GetEntitiesByWith(Expression<Func<TEntity, bool>> predicate, params Expression<Func<TEntity, object>>[] includes)
        => await GetEntitiesByWith(predicate, 0, 0, null, false, includes);
        public async Task<ICollection<TEntity>> GetEntitiesByWith(Expression<Func<TEntity, bool>> predicate = null, int skippedIndex = 0, int topResults = 0, Expression<Func<TEntity, object>> orderClause = null, bool ascending = false, params Expression<Func<TEntity, object>>[] includes)
        {
            IQueryable<TEntity> aux = predicate != null ? SetQuery(predicate) : Set;
            if (orderClause != null)
            {
                if (ascending)
                    aux = aux.OrderBy(orderClause);
                else
                    aux = aux.OrderByDescending(orderClause);
            }
            if (skippedIndex != 0)
                aux = aux.Skip(skippedIndex * topResults);
            if (topResults != 0)
                aux = aux.Take(topResults);
            foreach (var inc in includes)
                aux = aux.Include(inc);
            return await aux.ToListAsync(); ;
        }

        public void OverrideDbContext(T context)
        {
            Context = context;
        }
        public T GetDbContext()
        {
            return Context;
        }
        /// <summary>
        /// Unmaterialized query from associated set of related entity
        /// </summary>
        /// <param name="predicate"></param>
        /// <returns>IQueryable of related entity</returns>
        public IQueryable<TEntity> SetQuery(Expression<Func<TEntity, bool>> predicate) => Set.Where(predicate);

        /// <summary>
        /// Generates IQueryable, applies given reduction before executing query, then executes it and returns the collection async
        /// </summary>
        /// <param name="predicate"></param>
        /// <param name="transformation"></param>
        /// <returns>awaitable collection</returns>
        public async Task<ICollection<KEntity>> GetManyAndConvertBy<KEntity>(
            Expression<Func<TEntity, bool>> predicate,
            Expression<Func<TEntity, KEntity>> reduction,
            Expression<Func<TEntity, object>> orderClause = null,
            bool ascending = false,
            int skippedIndex = 0,
            int topResults = 0)
        {
            IQueryable<TEntity> aux = SetQuery(predicate);
            if (orderClause != null)
            {
                if (ascending)
                    aux = aux.OrderBy(orderClause);
                else
                    aux = aux.OrderByDescending(orderClause);
            }
            if (skippedIndex != 0)
                aux = aux.Skip(skippedIndex * topResults);
            if (topResults != 0)
                aux = aux.Take(topResults);
            return await aux.Select(reduction).ToListAsync();
        }
        /// <summary>
        /// Load items into context, applies given transformation and return the collection async, intended to use with lazy loading enabled
        /// </summary>
        /// <param name="predicate"></param>
        /// <param name="transformation"></param>
        /// /// <param name="skippedIndex">Pages to skip</param>
        /// <param name="topResults">Items per page</param>
        /// <returns>awaitable collection</returns>
        public async Task<ICollection<KEntity>> GetManyAndConvertByAfter<KEntity>(
            Expression<Func<TEntity, bool>> predicate,
            Expression<Func<TEntity, KEntity>> transformation,
            Expression<Func<TEntity, object>> orderClause = null,
            bool ascending = false,
            int skippedIndex = 0,
            int topResults = 0)
        {
            IQueryable<TEntity> aux = SetQuery(predicate);
            if (orderClause != null)
            {
                if (ascending)
                    aux = aux.OrderBy(orderClause);
                else
                    aux = aux.OrderByDescending(orderClause);
            }
            if (skippedIndex != 0)
                aux = aux.Skip(skippedIndex * topResults);
            if (topResults != 0)
                aux = aux.Take(topResults);
            await aux.LoadAsync();
            return aux.Select(transformation).ToList();
        }
        /// <summary>
        /// Load items into context, applies given transformation and return the collection async, intended to use with lazy loading disabled
        /// </summary>
        /// <param name="predicate"></param>
        /// <param name="transformation"></param>
        /// /// <param name="skippedIndex">Pages to skip</param>
        /// <param name="topResults">Items per page</param>
        /// <returns>awaitable collection</returns>
        public async Task<ICollection<KEntity>> GetManyAndConvertByAfter<KEntity>(
            Expression<Func<TEntity, bool>> predicate,
            Expression<Func<TEntity, KEntity>> transformation,
            Expression<Func<TEntity, object>> orderClause = null,
            bool ascending = false,
            int skippedIndex = 0,
            int topResults = 0,
            params Expression<Func<TEntity, object>>[] includes)
        {
            IQueryable<TEntity> aux = SetQuery(predicate);
            if (orderClause != null)
            {
                if (ascending)
                    aux = aux.OrderBy(orderClause);
                else
                    aux = aux.OrderByDescending(orderClause);
            }
            if (skippedIndex != 0)
                aux = aux.Skip(skippedIndex * topResults);
            if (topResults != 0)
                aux = aux.Take(topResults);
            foreach (var inc in includes)
                aux = aux.Include(inc);
            await aux.LoadAsync();
            return aux.Select(transformation).ToList();
        }
        public void SetEntityStateAsUnmodified<K>(K obj)
        {
            Context.Entry(obj).State = EntityState.Unchanged;
        }
        public void DisableLazyLoading()
        {
            Context.ChangeTracker.LazyLoadingEnabled = false;
        }
        public void EnableLazyLoading()
        {
            Context.ChangeTracker.LazyLoadingEnabled = true;
        }
        public Task<int> CountAsync(Expression<Func<TEntity, bool>> expression)
        {
            return SetQuery(expression).Distinct().CountAsync();
        }
        public Task<int> SelectAndCountAsync<K>(Expression<Func<TEntity, bool>> expression, Expression<Func<TEntity, K>> pipe)
        {
            return SetQuery(expression).Select(pipe).Distinct().CountAsync();
        }
        /// <summary>
        /// Save changes to database asynchronously
        /// </summary>
        /// <returns>Number of affected records</returns>
        public async Task<SaveChangesState> SaveChangesAsync()
        {
            try
            {
                await Context.SaveChangesAsync();
                return SaveChangesState.OK;
            }
            catch (Exception ex)
            {
                Logger.LogError(ex, "Exception while saving changes");
                throw;
            }
        }


        #endregion

        #region Dispose
        /// <summary>
        /// To dispose only internal set, use Dispose(false). Call Dispose(true) to flush internal context also.
        /// </summary>
        /// <param name="disposeContext">True to dispose context along with asociated related entity's set, False to not.</param>
        public void Dispose(bool disposeContext = false)
        {
            if (!disposed || disposeContext)
            {
                if (!disposed)
                    Set = null;
                disposed = true;
                if (disposeContext)
                {
                    if (!contextDisposed)
                        Context = null;
                    contextDisposed = true;
                }
                GC.SuppressFinalize(this);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public void Dispose() => Dispose(true);

        #endregion

    }
    public enum SaveChangesState
    {
        OK,
        KO
    }
}
