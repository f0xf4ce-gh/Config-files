local group = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd("FocusLost", {
  group = group,
  pattern = "*",
  command = "silent! wall",
})

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  group = group,
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.bo.modifiable then
      vim.defer_fn(function()
        if vim.api.nvim_buf_is_valid(0) and vim.bo.modified then
          vim.cmd("silent update")
        end
      end, 2000)
    end
  end,
})
