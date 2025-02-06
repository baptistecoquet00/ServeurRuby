require_relative "../Core/DB/DB.rb"

module App
    module Model
        class ProductModel < Core::DB::DB
            def initialize(id,name,price)
                @product_id = id
                @product_name = name
                @product_price = price
                super()
            end

            def get_product(product_id)
                query("SELECT * FROM product WHERE id =?",product_id)
            end

            def get_all_product()
                query("SELECT * FROM product")
            end

            def set_product_name(product_name,product_id)
                query("UPDATE product SET product_name = ? WHERE id = ? ",product_name,product_id)
            end

            def set_product_price(product_price,product_id)
                query("UPDATE product SET product_price = ? WHERE id = ?",product_price,product_id)
            end
        end
    end
end