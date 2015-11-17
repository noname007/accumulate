--            ngx.exit(200)
--          ngx.header.Location = "aaaaaa"
--         ngx.exit(304)
          local args = {}
          local r_m = ngx.var.request_method 
          -- #ngx.log(ngx.ERR,r_m)
              -- ngx.log(ngx.ERR,"===========","??????????????","ddddddddddddddddddd",10)
          if "GET" == r_m or "HEAD" == r_m then
            ngx.log(ngx.ERR,"GET============")
            args = ngx.req.get_uri_args()
          elseif "POST" == r_m then
                ngx.req.read_body()
            args = ngx.req.get_post_args()
            ngx.log(ngx.ERR,"POSTD-----------")
          end      
                   
        -- ngx.log(ngx.ERR,type(args))
                  for k,v in pairs(args) do
            -- ngx.log(ngx.ERR,"=====k=====>",vtype(k), " === v===>",type(v))
            ngx.log(ngx.ERR,"=====k=====>",type(k),":",k, " === v===>",type(v),":",v)
          end      
                   
          local new_rtmp = "rtmp://cdntrans.w.alikunlun.com/alicdn/"..args["app"]..args["name"].."?vhost=live.sevenga.cn&live_rtmp_test=on"
                   
        ngx.log(ngx.ERR,new_rtmp)
        ngx.header.Location = new_rtmp
        ngx.header.Location = "rtmp://192.168.1.174/"..args["app"].."/".."hhhhhh" 
        ngx.exit(304)
         -- if args["sign"] == nil then
                   
        --  ngx.header.Location = "301.mp4"
        --  ngx.exit(304)
         -- else   
            ngx.exit(200)   
        --  end    