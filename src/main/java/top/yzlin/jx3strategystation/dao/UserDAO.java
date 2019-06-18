package top.yzlin.jx3strategystation.dao;

import top.yzlin.jx3strategystation.database.annotation.QueryParam;
import top.yzlin.jx3strategystation.database.annotation.Save;
import top.yzlin.jx3strategystation.database.annotation.SaveOrUpdate;
import top.yzlin.jx3strategystation.database.annotation.Select;
import top.yzlin.jx3strategystation.entity.user.User;


public interface UserDAO {

    @Select("from User where userName=:userName and password=:password")
    User findUserByUserNameAndPassword(@QueryParam("userName") String userName,
                                       @QueryParam("password") String password);

    @Save
    int saveUser(User user);

    @SaveOrUpdate
    void updatePassword(User user);

    @SaveOrUpdate
    void updateUser(User user);



}
