- https://leetcode.com/problems/longest-common-prefix

  - sort before, above 10 elements quick sort is used

    - https://leetcode.com/submissions/detail/776043459/

      ```javascript
      function longestCommonPrefix(strs: string[]): string {
        for (let str of strs) if (str.length === 0) return "";

        strs.sort((a, b) => a.length - b.length);

        let ans = "";
        outerloop: for (let i = 0; i < strs[0].length; i++) {
          let cur = strs[0][i];
          let flag = true;
          for (let str of strs)
            if (str[i] !== cur) {
              break outerloop;
            }
          ans += cur;
        }
        return ans;
      }
      ```
