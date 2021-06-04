using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Data.Repositories.GenericRepository
{
    public interface IGenericRepository<T, TEntity> : IDisposable where T : DbContext
    {
        IQueryable<TEntity> SetQuery(Expression<Func<TEntity, bool>> predicate);
        void DetachEntries(ICollection<TEntity> entries);
        void DetachEntry(TEntity entry);
        void AttachEntries(ICollection<TEntity> entries);
        void AttachEntry(TEntity entry);
        Task<TEntity> GetFirstOrDefaultBy(Expression<Func<TEntity, bool>> predicate);
        Task<Kobject> GetFirstOrDefaultByOnlyWith<Kobject>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, Kobject>> select);
        Task<ICollection<TEntity>> GetManyBy(Expression<Func<TEntity, bool>> predicate);
        Task<ICollection<KEntity>> GetManyAndConvertBy<KEntity>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, KEntity>> transformation, Expression<Func<TEntity, object>> orderClause = null, bool ascending = false, int skippedIndex = 0, int topResults = 0);
        Task<ICollection<KEntity>> GetManyAndConvertByAfter<KEntity>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, KEntity>> transformation, Expression<Func<TEntity, object>> orderClause = null, bool ascending = false, int skippedIndex = 0, int topResults = 0);
        Task<ICollection<KEntity>> GetManyAndConvertByAfter<KEntity>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, KEntity>> transformation, Expression<Func<TEntity, object>> orderClause = null, bool ascending = false, int skippedIndex = 0, int topResults = 0, params Expression<Func<TEntity, object>>[] includes);
        void InsertEntry(TEntity entry);
        void InsertEntries(ICollection<TEntity> entries);
        void UpdateEntry(TEntity entry);
        void UpdateEntries(ICollection<TEntity> entries);
        void RemoveEntry(TEntity entry);
        void RemoveEntries(ICollection<TEntity> entries);
        IQueryable<TEntity> SetSkippedAndCappedQueryable(Expression<Func<TEntity, bool>> predicate, int skippedIndex = 0, int topResults = 0);
        Task<bool> AnyAsync(Expression<Func<TEntity, bool>> predicate);
        Task<ICollection<TEntity>> GetEntitiesByWith(Expression<Func<TEntity, bool>> predicate = null, int skippedIndex = 0, int topResults = 0, Expression<Func<TEntity, object>> orderClause = null, bool ascending = false, params Expression<Func<TEntity, object>>[] includes);
        Task<ICollection<TEntity>> GetEntitiesByWith(Expression<Func<TEntity, bool>> predicate, params Expression<Func<TEntity, object>>[] includes);
        void SetEntityStateAsUnmodified<K>(K obj);
        Task<SaveChangesState> SaveChangesAsync();
        void OverrideDbContext(T context);
        T GetDbContext();
        void DisableLazyLoading();
        void EnableLazyLoading();
        void Dispose(bool disposeContext = false);
    }

}
