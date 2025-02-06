require_relative "../Core/DB/DB.rb"

module App
    module Model
        class UserModel < Core::DB::DB
            def initialize(id,name,firstname,email,password)
                super()
                @user_id = id
                @user_name = name
                @user_firstname = firstname
                @user_email = email
                @user_pswd = password
            end

            def get_user(user_id)
                query("SELECT * FROM user WHERE = ?",user_id)
            end

            def get_all_user()
                query("SELECT * FROM user")
            end

            def set_user_name(user_id,user_name)
                query("UPDATE user SET user_name = ? WHERE id = ?",user_name,user_id)
            end

            def set_user_firstname(user_id,user_firstname)
                query("UPDATE user SET user_firstname = ? WHERE id = ?",user_firstname,user_id)
            end

            def set_user_email(user_id,user_email)
                query("UPDATE user SET user_email = ? WHERE id = ?",user_email,user_id)
            end

            def set_user_pswd(user_id,user_pswd)
                query("UPDATE user SET user_pswd = ? WHERE id = ?",user_pswd,user_id)
            end

            def add_user(user_name,user_firstname,user_email,user_pswd)
                query("INSERT INTO user(user_name,user_firstname,user_email,user_pswd) VALUES (?,?,?,?)",user_name,user_firstname,user_email,user_pswd)
            end
        end
    end
end