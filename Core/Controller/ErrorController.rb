module Core
    module Controller
        class ErrorController

            def not_found
                render("<h1> Error 404 - Page Not Found</h1>", status: 404)
            end

            def internal_server_error
                render("<h1>Error 500 - Internal Server Error </h1>", status: 500)
            end

            def forbidden
                render("<h1>Error 403 - Forbidden </h1>", status: 403)
            end

            private

            def render(content, status: 200, content_type:"text/html")
                [status, {"Content-type" => content_type}, [content]]
            end
        end
    end
end