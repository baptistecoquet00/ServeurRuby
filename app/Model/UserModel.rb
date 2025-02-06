require_relative "../Core/DB/DB.rb"

module App
    module Model
        class UserModel < Core::DB::DB
            def initialize(id,name,firstname)
                super()
                @user_id = id
                @user_name = name
                @user_firstname = firstname
            end

            def get_user(user_id)
                query("SELECT * FROM user WHERE = ?",user_id)
            end

            def get_all_user()
                query("SELECT * FROM user")
            end

            def set_user_name(user_name,user_id)
                query("UPDATE user SET user_name = ? WHERE id = ?",user_name,user_id)
            end

            def set_user_firstname(user_firstname,user_id)
                query("UPDATE user SET user_firstname = ? WHERE id = ?",user_firstname,user_id)
            end
        end

    end
end