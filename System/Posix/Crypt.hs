{-# LANGUAGE ForeignFunctionInterface #-}
module System.Posix.Crypt (crypt) where 
import Foreign.C
foreign import ccall unsafe "crypt" cCrypt :: CString-> CString -> CString

crypt :: String    -- key
      -> String    -- seed
      -> IO String -- hash
crypt key seed = do k <- newCString key
                    s <- newCString seed
                    peekCString $ cCrypt k s
