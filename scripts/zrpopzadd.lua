local toMove = redis.call('ZRANGE', KEYS[1], -1, -1, 'WITHSCORES');

if #toMove > 0 then
  local member = toMove[1];
  local score = toMove[2];

  redis.call('ZREM', KEYS[1], member);
  redis.call('ZADD', KEYS[2], score, member);

  return member;
end
