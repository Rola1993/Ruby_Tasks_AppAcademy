def ftoc(f)
  freezing = f.to_f - 32.0
  c = freezing * 5.0 / 9.0
  return c
end

def ctof(c)
  f = c.to_f * 9.0 / 5.0 + 32.0
  return f
end
