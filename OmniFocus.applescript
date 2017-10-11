on run argv

-- declaring variables
set setName to null
set setContext to null
set setDueDate to date current date
set focusedDocument to null

-- parse Alfred's input to separate items

set AppleScript's text item delimiters to {" | "}
set alfredInput to argv
set alfredInput to "Journalese Reading Questions | Intermediate Composition | 10-16-17"


tell application "OmniFocus"
    tell front document
        -- ORDER OF INPUT: Name, Context, Due Date
        set alfredInput to text items of alfredInput
        set setName to item 1 of alfredInput
        set setContext to first flattened context where its name is (item 2 of alfredInput)
        -- set setDueDate to date item 3 of alfredInput


        if focusedDocument is null then
            -- DEPRECATED --
            -- parse tasks into default document with transport text alfredInput

            make new task with properties { ¬
                name:setName, ¬
                context:setContext, ¬
                due date:setDueDate ¬
            }
        else
            -- DEPRECATED --
            -- parse tasks into focusedDocument with transport text alfredInput

            make new task with properties { ¬
                name:setName, ¬
                context:setContext, ¬
                due date:setDueDate ¬
            }
        end if
    end tell
end tell
end run
