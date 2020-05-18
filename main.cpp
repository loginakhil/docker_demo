#include <iostream>
#include <iomanip>
#include <filesystem>
#include <nlohmann/json.hpp>

int main() {

    // compute the space usage
    std::filesystem::space_info s_info = std::filesystem::space("/");

    // compose json document
    nlohmann::json json_doc;
    
    json_doc["capacity"] = s_info.capacity;
    json_doc["free_space"] = s_info.free;
    json_doc["available_space"] = s_info.free;

    // pretty print the json
    std::cout << std::setw(4) << json_doc << std::endl;

    return 0;
}
