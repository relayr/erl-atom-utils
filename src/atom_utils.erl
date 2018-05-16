%%------------------------------------------------------------------------------
%% @author kuba.odias
%% @copyright relayr 2009-2018
%% @doc Miscellaneous functions for Erlang atoms processing.
%% @end
%%------------------------------------------------------------------------------
-module(atom_utils).

%%------------------------------------------------------------------------------
%% Include files
%%------------------------------------------------------------------------------

%%------------------------------------------------------------------------------
%% Function exports
%%------------------------------------------------------------------------------
-export([
    from_string/1,
    append_id/2,
    append_suffix/2
]).

%% =============================================================================
%% Exported functions
%% =============================================================================
%% @doc Wrapper for list_to_existing_atom.
-spec from_string(String :: string() | binary()) -> Atom :: atom().
from_string(String) when is_binary(String) ->
    from_string(binary_to_list(String));
from_string(String) when is_list(String) ->
    try list_to_existing_atom(String)
    catch error:badarg ->
        list_to_atom(String)
    end.

-spec append_id(Atom :: atom(), Id :: integer()) -> atom().
append_id(Atom, Id) ->
    IdStr = integer_to_list(Id),
    append_suffix(Atom, "_" ++ IdStr).

-spec append_suffix(Base :: atom(), Suffix :: string()) -> Result :: atom().
append_suffix(Base, Suffix) when is_atom(Base), is_list(Suffix) ->
    BaseStr = atom_to_list(Base),
    from_string(BaseStr ++ Suffix).

%% =============================================================================
%% Local functions
%% =============================================================================
