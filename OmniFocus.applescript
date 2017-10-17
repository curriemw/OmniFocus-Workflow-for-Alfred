on run argv
    set AppleScript's text item delimiters to {" | "}
    -- declaring variables
    set setName to null
    set setContext to null
    set focusedDocument to null

    -- parse Alfred's input to separate items
    -- set alfredInput to argv as text
    set alfredInput to "Test Item | Mac | 10-12-17 | 10-13-17"
    set alfredInput to text items of alfredInput
    set setName to (item 1 of alfredInput)
    set setDeferDate to date (item 3 of alfredInput)
    set setDueDate to date (item 4 of alfredInput)
    set setNote to (item 5 of alfredInput)
            tell application "OmniFocus"
                tell front document
                    -- ORDER OF INPUT: Name, Context, Due Date
                    set setContext to first flattened context where its name is (item 2 of alfredInput)
                    oftask()
                    
                end tell
            end tell
        try

        on error number -1728
            set setNote to null
        end try
end run

--this breaks the code.
on oftask()
    make new inbox task with properties { ¬
        name:setName, ¬
        context:setContext, ¬
        defer date:setDeferDate, ¬
        due date:setDueDate, ¬
        note:setNote ¬
    }
end oftask
--make good noise if return 0
--make bad noise if return error