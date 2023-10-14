local ok, bbq = pcall(require, "barbecue")
if not ok then
	return
end

bbq.setup({ theme = "catppuccin" })
