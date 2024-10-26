local helper = require("zebrazone.test.helper")
local zebrazone = helper.require("zebrazone")

describe("zebrazone.start()", function()
  before_each(helper.before_each)
  after_each(helper.after_each)

  it("does not raise error", function()
    zebrazone.start()
  end)
end)

describe("zebrazone.stop()", function()
  before_each(helper.before_each)
  after_each(helper.after_each)

  it("does not raise error", function()
    zebrazone.stop()
  end)
end)
