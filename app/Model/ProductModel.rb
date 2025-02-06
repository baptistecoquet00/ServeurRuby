require_relative "../Core/DB/DB.rb"

module App
    module Model
        class ProductModel < Core::DB::DB
            def initialize(id,name,price,description)
                super()
                @product_id = id
                @product_name = name
                @product_price = price
                @product_description = description  
            end

            def get_product(product_id)
                query("SELECT * FROM product WHERE id =?",product_id)
            end

            def get_all_product()
                query("SELECT * FROM product")
            end

            def set_product_name(product_id,product_name)
                query("UPDATE product SET product_name = ? WHERE id = ? ",product_name,product_id)
            end

            def set_product_price(product_id,product_price)
                query("UPDATE product SET product_price = ? WHERE id = ?",product_price,product_id)
            end

            def set_product_description(product_id,product_description)
                query("UPDATE product SET product_description = ? WHERE id = ?",product_description,product_id)
            end

            def add_product(product_name,product_price,product_description)
                query("INSERT INTO product(product_name,product_price,product_description) VALUES (?,?,?)",product_name,product_price,product_description)
            end
        end
    end
end