const PORT = process.env.PORT || 3000;
const express = require('express')
const app = express()
app.get("/a",(req,res)=>{
  res.send("ge it bro..get it")
})
app.listen(PORT,()=>{
  console.log("runnig...")
})
