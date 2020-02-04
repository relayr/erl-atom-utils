%%------------------------------------------------------------------------------
%% @author kuba.odias
%% @copyright relayr 2009-2018
%%------------------------------------------------------------------------------
-module(atom_utils_tests).

%%------------------------------------------------------------------------------
%% Include files
%%------------------------------------------------------------------------------

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

%% =============================================================================
%% Unit tests
%% =============================================================================

from_string_test() ->
    Atom1 = atom_utils:from_string("testAtom"),
    ?assertEqual(testAtom, Atom1),
    Atom1 = atom_utils:from_string("testAtom"),   % test once again and check if it doesn't crash
    ?assertEqual(testAtom, Atom1),
    Atom2 = atom_utils:from_string("MyAtom"),
    ?assertEqual('MyAtom', Atom2),
    Atom3 = atom_utils:from_string("46.1"),
    ?assertEqual('46.1', Atom3),
    Atom4 = atom_utils:from_string(""),
    ?assertEqual('', Atom4),
    %% binaries
    Atom5 = atom_utils:from_string(<<"MyAtom">>),
    ?assertEqual('MyAtom', Atom5),
    Atom6 = atom_utils:from_string(<<"">>),
    ?assertEqual('', Atom6).

append_suffix_test() ->
    Atom1 = atom_utils:append_suffix(atom1, "buba"),
    ?assertEqual(atom1buba, Atom1),
    Atom2 = atom_utils:append_suffix(atom1, ""),
    ?assertEqual(atom1, Atom2),
    Atom3 = atom_utils:append_suffix('Atom1', "buba"),
    ?assertEqual('Atom1buba', Atom3),
    Atom4 = atom_utils:append_suffix('', "lufa"),
    ?assertEqual(lufa, Atom4),
    Atom5 = atom_utils:append_suffix(animal, <<"s">>),
    ?assertEqual(animals, Atom5).

append_id_test() ->
    Atom1 = atom_utils:append_id(atom, 3),
    ?assertEqual(atom_3, Atom1),
    Atom2 = atom_utils:append_id(atom, -5),
    ?assertEqual('atom_-5', Atom2),
    Atom3 = atom_utils:append_id('Atom1', 470),
    ?assertEqual('Atom1_470', Atom3),
    Atom4 = atom_utils:append_id('', 35),
    ?assertEqual('_35', Atom4).

-endif.
