local Plugin = {'williamboman/mason.nvim'}  

function Plugin.config(_, opts)
    require('mason').setup(opts)
end

return Plugin
