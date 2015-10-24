private static string myEncoder(string a, byte[] c, bool isToBase64)
        {
            string result = "";
            List<byte> bytesR = new List<byte>();
            int f = 0, h = 0, q = 0;
            int[] b = new int[256];
            for (int i = 0; i < 256; i++)
                    b[i] = i;
            while (h < 256)
            {
                f = (f + b[h] + a[h % a.Length]) % 256;
                int temp = b[h];
                b[h] = b[f];
                b[f] = temp;
                h++;
            }
            f = 0; h = 0; q = 0;
            while (q < c.Length)
            {
                h = (h + 1) % 256;
                f = (f + b[h]) % 256;
                int temp = b[h];
                b[h] = b[f];
                b[f] = temp;
                byte[] bytes = new byte[] { (byte)(c[q] ^ b[(b[h] + b[f]) % 256]) };

       
                bytesR.Add(bytes[0]);
                result += System.Text.ASCIIEncoding.ASCII.GetString(bytes);
                q++;
            }
            if (isToBase64)
            {
                Byte[] byteR = bytesR.ToArray();
                result = Convert.ToBase64String(byteR);
            }
            return result;
        }
        public static void getEp(string vid, string ep, ref string pNew, ref string token, ref string sid)
        {
            string template1 = "becaf9be";
            string template2 = "bf7e5f01";
            byte[] bytes = Convert.FromBase64String(ep);
            ep = ystem.Text.ASCIIEncoding.ASCII.GetString(bytes);
            string temp = myEncoder(template1, bytes, false);
            string[] part = temp.Split('_');
            sid = part[0];
            token = part[1];
            string whole = string.Format("{0}_{1}_{2}", sid, vid, token);
            byte[] newbytes = System.Text.ASCIIEncoding.ASCII.GetBytes(whole);
            epNew = myEncoder(template2, newbytes, true);
        }