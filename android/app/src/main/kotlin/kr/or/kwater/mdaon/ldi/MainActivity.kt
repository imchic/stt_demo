package kr.or.kwater.mdaon.ldi

import android.os.Bundle
import android.os.IBinder
import android.os.RemoteException
import io.flutter.embedding.android.FlutterActivity
import net.secuwiz.SecuwaySSLU.service21.IMobileApi

class MainActivity: FlutterActivity() {

    var tempService: IBinder? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)


        var strResult = "error"

        if (tempService != null) {
            val objAidl =
                IMobileApi.Stub.asInterface(tempService)

            try {
                //아이디,비밀번호를 이용하여 vpn 시작
//                strResult = objAidl.StartVpn(
//                    editAddr.getText().toString(),
//                    editId.getText().toString(),
//                    editPwd.getText().toString()
//                )

                if (strResult != null && strResult == "0") {
                    //연결성공
                    println("startvpn")

                    val strFavorite = objAidl.GetFavorite()

                    //이름,주소|이름,주소| .... 순으로 나열되므로 split하여 사용
                    println("favorite name : $strFavorite")

                    if (strFavorite.contains("\\|")) {
                        val arrFavorite =
                            strFavorite.split("\\|".toRegex()).dropLastWhile { it.isEmpty() }
                                .toTypedArray()
                        val arrName = arrayOfNulls<String>(arrFavorite.size)
                        val arrURL = arrayOfNulls<String>(arrFavorite.size)

                        for (i in arrFavorite.indices) {
                            arrName[i] = arrFavorite[i].substring(0, arrFavorite[i].indexOf(","))
                            arrURL[i] = arrFavorite[i].substring(arrFavorite[i].indexOf(",") + 1)

                            println("favorite name : " + arrName[i])
                            println("favorite url : " + arrURL[i])
                        }
                    }
                } else {
                    println("startvpn error: $strResult")
                }
            } catch (e: RemoteException) {
                e.printStackTrace()
            }

        }
    }
}
