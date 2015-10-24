#include <jsonxx.h>
const jsonxx::String& ep_str = data2_obj.get<jsonxx::Array>("data").get<jsonxx::Object>(0).get<jsonxx::String>("ep");
std::string ep_str_decode;
base64_decode(ep_str.begin(), ep_str.end(), std::back_inserter(ep_str_decode));
std::string sid_and_token = youku_f("becaf9be", ep_str_decode);
std::size_t underline_pos = sid_and_token.find('_');
if (underline_pos == std::string::npos) {
    return {};
}
std::string sid(sid_and_token.begin(), sid_and_token.begin() + underline_pos);
std::string token(sid_and_token.begin() + underline_pos + 1, sid_and_token.end());

std::string youku_f(const std::string& str1, const std::string& str2)
{
    std::array<std::size_t, 256> table;
    std::iota(table.begin(), table.end(), 0);
    std::size_t t = 0;
    for (std::size_t i = 0; i < table.size(); ++i) {
        t = ((t + table[i]) + str1[i % str1.size()]) % table.size();
        std::swap(table[i], table[t]);
    }
    std::string result;
    for (std::size_t i = 0, j = 0, k = 0; i < str2.size(); ++i) {
        k = (k + 1) % table.size();
        j = (j + table[k]) % table.size();
        std::swap(table[j], table[k]);
        result.push_back(str2[i] ^ table[(table[j] + table[k]) % table.size()]);
    }
    return result;
}