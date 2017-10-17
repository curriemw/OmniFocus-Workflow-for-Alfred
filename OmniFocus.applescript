on run argv
    set AppleScript's text item delimiters to {" | "}
    -- declaring variables
    set setName to null
    set setContext to null
    set focusedDocument to null
    set hasError to null


    -- parse Alfred's input to separate items
    -- set alfredInput to argv as text
    set alfredInput to "Test Item | Mac | 10-12-17 | 10-13-17"
    set alfredInput to text items of alfredInput
    set setName to (item 1 of alfredInput)
    set setDeferDate to date (item 3 of alfredInput)
    set setDueDate to date (item 4 of alfredInput)
    set setNote to (item 5 of alfredInput)

        repeat while hasError is not 0
            try
                tell application "OmniFocus"
                    -- ORDER OF INPUT: Name, Context, Due Date
                    set setContext to first flattened context where its name is (item 2 of alfredInput)
                    my oftask()
                end tell

            on error number -1728
                set hasError to 1
                set setNote to null

            end try
        end repeat

end run

on oftask()
    tell front document of application "OmniFocus"
        -- ORDER OF INPUT: Name, Context, Due Date
        make new inbox task with properties { ¬
            name:setName, ¬
            context:setContext, ¬
            defer date:setDeferDate, ¬
            due date:setDueDate, ¬
            note:setNote ¬
        }
    end tell
end oftask
--make good noise if return 0
--make bad noise if return error