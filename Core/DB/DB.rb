require "dbi"

module Core
    module DB
        class DB
            def initialize(host,user,mdp,bdd,sgbd)
                @host = host
                @user = user
                @mdp = mdp
                @bdd = bdd
                @sgbd = sgbd
                @dbi = nil
            end

            def query(statement, *params)
                connect
                req = @dbi.prepare(statement)
                req.execute(*params)
                results = req.fetch_all
                results
              rescue DBI::DatabaseError => e
                puts "Erreur d'éxécution de la requête : #{e.message}"
              ensure
                req.finish if req
            end

            private 
            

            def connect
                @dbi ||= DBI.connect('DBI:#{sgbd}:dbname=#{@bdd};host=#{@host};port=5432',@user,@mdp)
            rescue DBI::DatabaseError => e
                puts "Erreur de connection : #{e.message}"
            end

            def disconnet
                @dbi.disconnect if @dbi
                @dbi = nil
            rescue DBI::DatabaseError => e
                puts "Erreur de déconnexion : #{e.message}"
            end
        end
    end
end          


