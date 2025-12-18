using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;
using TaskManagement.IRepo;
using TaskManagement.Model;

namespace TaskManagement.Repo
{
    public class UserRepository : IUserRepository
    {
        private readonly IDbConnection _db;

        public UserRepository(IConfiguration config)
        {
            _db = new SqlConnection(
                config.GetConnectionString("DefaultConnection")
            );
        }
        public void Register(User user)
        {
            var parameters = new DynamicParameters();

            parameters.Add("@FullName", user.FullName);
            parameters.Add("@Email", user.Email);
            parameters.Add("@PasswordHash", user.PasswordHash);

            _db.Execute(
                "sp_RegisterUser",
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }
        public User Login(string email)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Email", email);

            return _db.QueryFirstOrDefault<User>(
                "sp_LoginUser",
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }
    }
}
