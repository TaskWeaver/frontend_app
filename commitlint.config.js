// module.exports = {extends: ['@commitlint/config-conventional']}
module.exports = {
  rules: {
    "header-max-length": [2, "always", 100],

    "type-enum": [
      2,
      "always",
      [
        "build",
        "chore",
        "ci",
        "docs",
        "feat",
        "feature",
        "fix",
        "refactor",
        "style",
        "test",
      ],
    ],
    "type-empty": [2, "never"],
    "type-case": [2, "always", "lower-case"],

    "subject-empty": [2, "never"],
    "subject-case": [
      0,
      "never",
      ["sentence-case", "start-case", "pascal-case", "upper-case"],
    ],

    "body-leading-blank": [2, "always"],
    "body-max-line-length": [2, "always", 200],
    "body-case": [0, "never", []],

    "footer-leading-blank": [1, "always"],
    "footer-max-line-length": [2, "always", 100],
  },
  plugins: [
    {
      rules: {
        "develop-rule": ({ subject }) => {
          const commitFolders = ["[data]", "[ui]"];
          return [
            commitFolders.some(
              (folder) =>
                subject?.startsWith(folder) !== subject?.endsWith(folder)
            ),
            `\n${commitFolders.map((folder) => `${folder}\n`).join("")}
위 네 가지 중 한 가지는 반드시 콜론(:) 뒤에 포함되어야 합니다.
[name] 뒤에 메시지 입력은 필수입니다.

ex) feat: [frontend] 마우스 더블클릭 후 스타일 변경`,
          ];
        },
      },
    },
  ],
};
