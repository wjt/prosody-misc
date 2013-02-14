-- mod_logfullstanzas: logs the full contents of s2s stanzas at the 'debug' level.
--
-- © 2013 Kim Alvefur <zash@zash.se>
-- © 2013 Collabora Ltd <http://www.collabora.com/>
--
-- This module is MIT/X11 licensed. Please see the
-- COPYING file in the source package for more information.

local add_filter = require "util.filters".add_filter;

function stanza_log_hook(event)
  local s2s = event.session;

  add_filter(s2s, "stanzas/in", function(stanza)
      module:log("debug", "s2s stanza in: %s", tostring(stanza));
      return stanza;
  end);
  add_filter(s2s, "stanzas/out", function(stanza)
      module:log("debug", "s2s stanza out: %s", tostring(stanza));
      return stanza;
  end);
end

module:hook("s2sout-established", stanza_log_hook);
module:hook("s2sin-established", stanza_log_hook);
