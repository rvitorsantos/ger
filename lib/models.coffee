q = require 'q'

GER_Models= {}

class KVStore
  constructor: () ->
    @store = {}

  set: (key, value) ->
    return q.fcall(=> @store[key] = value; return) 
  
  get: (key) ->
    return  q.fcall(=> @store[key])


class Set
  constructor: () ->
    @store = {}

  add: (value) ->
    return q.fcall(=> @store[value] = true; return) 

  contains: (value) ->
    return q.fcall(=> !!@store[value]) 

GER_Models.KVStore = KVStore
GER_Models.Set = Set

#AMD
if (typeof define != 'undefined' && define.amd)
  define([], -> return GER_Models)
#Node
else if (typeof module != 'undefined' && module.exports)
    module.exports = GER_Models;
