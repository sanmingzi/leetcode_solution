# leetcode_0065

- [Valid Number](https://leetcode.com/problems/valid-number/)
- [source code by Ruby](leetcode_0065.rb)

## problem description

Validate if a given string can be interpreted as a decimal number.

- Example

```
" 111 " => true
" +111 " => true
" ++111 " => false
".2e11" => true
"+.2e11" => true
"+.2e+11" => true
"+.2e-11" => true
"+.2e1.1" => false
"abc" => false
"+1.e10" => true
"+1.e-10" => true
```

I think some test case of this problem is not correct.

```
"1."
".1"
```

For above two case, the output should be false. But the expected result of test case is true.
