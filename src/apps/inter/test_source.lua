-- Use of this source code is governed by the Apache 2.0 license; see COPYING.

module(...,package.seeall)

local Transmitter = require("apps.inter.transmitter")
local Source = require("apps.basic.basic_apps").Source

function start (ring_name)
   local c = config.new()
   config.app(c, "tx", Transmitter, {name=ring_name})
   config.app(c, "source", Source)
   config.link(c, "source.output->tx.input")
   engine.configure(c)
   engine.main()
end
