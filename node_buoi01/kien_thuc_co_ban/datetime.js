exports.timeZome = "GTM +7";

exports.today = ()=>{
  const d = new Date();
  return d.toDateString();
}

exports.now = ()=>{
  const n = new Date();
  return n.toTimeString();
}