on run argv
	set AppleScript's text item delimiters to {" | "}

    -- declaring variables
    set setName to null
    set setContext to null
    set focusedDocument to null

    -- parse Alfred's input to separate items
    set alfredInput to argv as text
    set alfredInput to text items of alfredInput
    tell application "OmniFocus"
        tell front document
            -- ORDER OF INPUT: Name, Context, Due Date
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