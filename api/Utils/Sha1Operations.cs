using System.Text;
using XSystem.Security.Cryptography;

namespace api.Utils;

public static class Sha1Operations
{
    public static string Hash(this string input)
    {
        using SHA1Managed sha1 = new();
        var hash = sha1.ComputeHash(Encoding.Unicode.GetBytes(input));
        StringBuilder sb = new(hash.Length * 2);

        foreach (byte b in hash)
        {
            // can be "x2" if you want lowercase
            sb.Append(b.ToString("X2"));
            //sb.Append(b);
        }

        return sb.ToString();
    }
}