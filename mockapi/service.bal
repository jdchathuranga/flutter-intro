import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
# 
#

public type User record {
    string username;
    string firstName;
    string lastName;
};

public type LgoinRequest record {
    string username;
    string password;
};

service / on new http:Listener(9090) {
    resource function get profile(string username) returns User|error {
        if username == "chathuranga" { 
            return {
                username: "chathuranga",
                firstName: "Chathuranga",
                lastName: "Dissanayake"
            };
        } else {
            return error("User not found");
        }
    }

    resource function post login(LgoinRequest login) returns User|error {
        if login.username == "chathuranga" && login.password == "123" {
            return {
                username: "chathuranga",
                firstName: "Chathuranga",
                lastName: "Dissanayake"
            };
        } else {
            return error("Invalid username or password");
        }
    }
}
