local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {

  s(
    "!fastio",
    t({
      "ios::sync_with_stdio(false);",
      "cin.tie(nullptr);",
    })
  ),

  s(
    "!lc",
    fmt(
      [[
#include <bits/stdc++.h>
using namespace std;


  ]],
      {}
    )
  ),

  s(
    "!cp",
    fmt(
      [[
#include <bits/stdc++.h>
using namespace std;

int main() {{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    {}
}}
  ]],
      { i(0) }
    )
  ),

  s(
    "!bits",
    fmt(
      [[
#include <bits/stdc++.h>
using namespace std;


  ]],
      {}
    )
  ),

  s(
    "!print",
    fmt(
      [[
template <typename S, typename T>
std::ostream& operator<<(std::ostream& out, const pair<S, T>& p) {{
    out << "(" << p.first << "," << p.second << ") ";
    return out;
}}

template <typename T>
std::ostream& operator<<(std::ostream& out, const vector<T>& vec) {{
    for (const T& t : vec)
        out << t << ' ';
    return out;
}}

template <typename T>
std::ostream& operator<<(std::ostream& out, const vector<vector<T>>& vec2d) {{
    for (const vector<T>& vec1d : vec2d)
        out << vec1d << '\n';
    return out;
}}
  ]],
      {}
    )
  ),
})

-- print("snippet")
