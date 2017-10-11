on run argv

    -- declaring variables
    set setName to null
    set setContext to null
    set focusedDocument to null

    -- parse Alfred's input to separate items

    set AppleScript's text item delimiters to {" | "}
    set alfredInput to argv
    set alfredInput to "Hello World 2.0 | Mac"

    tell application "OmniFocus"
        tell front document
            -- ORDER OF INPUT: Name, Context, Due Date
            set alfredInput to text items of alfredInput
            set setName to item 1 of alfredInput
            set setContext to first flattened context where its name is (item 2 of alfredInput)
            -- set setDueDate to date item 3 of alfredInput
            make new inbox task with properties { ¬
                name:setName, ¬
                context:setContext ¬
            }
        end tell
    end tell
end run
