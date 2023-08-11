-- ~/.config/lvim/telescope_custom/creatingfile.lua

local M = {}

function M.create_file_prompt()
    local path = vim.fn.input("Dateipfad: ")
    local filename = vim.fn.input("Dateiname: ")

    if path ~= "" and filename ~= "" then
        local full_path = vim.fn.expand(path .. "/" .. filename)
        local success = vim.fn.writefile({}, full_path)
        if success == 1 then
            vim.api.nvim_out_write("Datei '" .. full_path .. "' wurde erstellt.\n")
        else
            vim.api.nvim_err_write("Fehler beim Erstellen der Datei.\n")
        end
    else
        vim.api.nvim_err_write("Ungültiger Pfad oder Dateiname.\n")
    end
end

return M
