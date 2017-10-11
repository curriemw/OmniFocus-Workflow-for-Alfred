on run argv
set alfredInput to argv
-- TODO: fix focusedDocument input
set focusedDocument to null
tell application "OmniFocus"
    if focusedDocument is null then
        parse tasks into default document with transport text alfredInput
    else
        parse tasks into focusedDocument with transport text alfredInput
    end if
end tell
end run