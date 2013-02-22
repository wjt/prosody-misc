mod_logfullstanzas
------------------

Logs all s2s stanzas sent and received at level _debug_. Contrast with
Prosody's built-in logging, which only logs the top element of the stanza. This
might be useful when debugging why stanzas are mysteriously not being
delivered. For instance, Google Talk sends invalid IQs with two child elements
when starting a Jingle call, which [Prosody (rightly) rejects][248].

[248]: http://code.google.com/p/lxmppd/issues/detail?id=248

Tested with Prosody 0.8.2; known not to work with Prosody 0.7.x. Note that this
only logs stanzas once the s2s session is established, and so will not help you
diagnose [dialback][] failures.

[dialback]: http://xmpp.org/extensions/xep-0220.html

Based on code by Kim “Zash” Alvefur pasted to <prosody@conference.prosody.im>.

Patches to make it also log all c2s stanzas welcome.
