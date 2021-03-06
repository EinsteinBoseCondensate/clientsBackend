using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Domain.Extensions
{
    public class SwapVisitor : ExpressionVisitor
    {
        private readonly Expression from, to;
        public SwapVisitor(Expression from, Expression to)
        {
            this.from = from;
            this.to = to;
        }
        public override Expression Visit(Expression node)
        {
            return node == from ? to : base.Visit(node);
        }
    }
    public static class ExpressionHelper
    {

        public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> expr, Expression<Func<T, bool>> or)
        {
            if (expr == null) return or;
            return Expression.Lambda<Func<T, bool>>(Expression.OrElse(new SwapVisitor(expr.Parameters[0], or.Parameters[0]).Visit(expr.Body), or.Body), or.Parameters);
        }

        public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> expr, Expression<Func<T, bool>> and)
        {
            if (expr == null) return and;
            return Expression.Lambda<Func<T, bool>>(Expression.AndAlso(new SwapVisitor(expr.Parameters[0], and.Parameters[0]).Visit(expr.Body), and.Body), and.Parameters);
        }
       
    }


}
