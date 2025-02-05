module Core
    module Router
        class Router
            def initialize()
                @routes = {}
            end
            
            def add_route(path,controller,action)
                @routes[path] = {
                    controller: controller,
                    action:  action
                }
            end

            def dispatch(request_path)
                route = @routes[request_path]

                if route
                    controller_class = route[:controller]
                    action = route[:action]
                    
                    controller = controller_class.new
                    instance_controller(controller,action)
                else
                    handle_error("La route #{request_path} n'existe pas.")
                    
                end
            end
            
            private

            def instance_controller(controller,action)
               if controller.respond_to?(action)
                controller.public_send(action)
               else
                handle_error("l'acttion #{action} n'existe pas dans le controller #{controller.class}")
               end
            end

            def handle_error(message)
                puts "Erreur 404: #{message}"
            end
        end
    end
end