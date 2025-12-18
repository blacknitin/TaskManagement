using TaskManagement.Model;

namespace TaskManagement.IRepo
{
    public interface IUserRepository
    {
        void Register(User user);
        User Login(string email);
    }
}
