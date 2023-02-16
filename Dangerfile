# Messages other than the target code are excluded
github.dismiss_out_of_range_messages

# If you're dealing with a legacy project, with tons of warnings, you may want to lint only new/modified files. You can easily achieve that, setting the only_modified_files parameter to true.
# flutter_lint.only_modified_files = true

# Specify the output file of execution result of flutter analyze.
flutter_lint.report_path = "flutter_analyze_report.txt"
# Display result as comment in PullRequest
flutter_lint.lint(inline_mode: true)

# Check if the work of the pull request is described
warn "作業内容についての説明を記載してください。（1行以上）" if github.pr_body.length < 1
