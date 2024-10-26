include spec/.shared/neovim-plugin.mk

spec/.shared/neovim-plugin.mk:
	git clone https://github.com/notomo/workflow.git --depth 1 spec/.shared

RESULT_DIR := ./spec/lua/zebrazone/virtes/screenshot
screenshot:
	nvim --clean -n +"lua dofile('./spec/lua/zebrazone/virtes/scenario.lua')('${RESULT_DIR}')" +"quitall!"
.PHONY: screenshot
