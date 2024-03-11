#include <iostream>
#include "httplib.h"

int main() {
    httplib::Server svr;

    svr.Get("/", [](const httplib::Request& /*req*/, httplib::Response& res) {
        res.set_content("Hello, World!", "text/plain");
    });

    svr.listen("0.0.0.0", 3000);
    std::cout << "Server started at http://localhost:3000" << std::endl;

    return 0;
}