return {

    -- render markdown
    {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
      },
      ft = { "markdown", "md", "quarto", "rmd" },
      opts = {
        enabled = true,
        render_modes = { "n", "c", "t" },
        max_file_size = 10.0,               -- MB

        heading = {
          enabled = true,
          sign = true,
          icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
          width = "full",
        },
        code = {
          enabled = true,
          sign = false,
          width = "block",
          right_pad = 1,
        },
        checkbox = {
          enabled = true,
        },
        bullet = {
          enabled = true,
        },
      },
      keys = {
        {
          "<leader>mr",
          function()
            require("render-markdown").toggle()
          end,
          desc = "Toggle Markdown Render",
        },
        {
            "<leader>mp",
            function()
                require("render-markdown").preview()
            end,
            desc = "Markdown Live Preview (right panel)",
        },
      },
    },


    -- images
    {
      "3rd/image.nvim",
      opts = {
        backend = "kitty",           
        processor = "magick_cli",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = true,
            only_render_image_at_cursor = false,
          },
        },
        max_height_window_percentage = 50,
      },
    },

    -- LateX
    {
      "lervag/vimtex",
      lazy = false,     -- we don't want to lazy load VimTeX
      -- tag = "v2.15", -- uncomment to pin to a specific release
      init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
      end
    },

}
