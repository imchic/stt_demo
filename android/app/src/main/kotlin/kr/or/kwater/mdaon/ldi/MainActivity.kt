package kr.or.kwater.mdaon.ldi

import android.content.ComponentName
import android.content.Intent
import android.content.ServiceConnection
import android.os.Bundle
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.RemoteException
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import kr.or.kwater.mdaon.ldi.MainActivity.SecuwayServiceConnection
import net.secuwiz.SecuwaySSLU.kwater21.IMobileApi

var tempService: IBinder? = null
private val mConnection = SecuwayServiceConnection()

var addr = ""
var id = ""
var pwd = ""
var otp = ""

lateinit var channel: MethodChannel

// handler ui
val handler = Handler(Looper.getMainLooper())

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        GeneratedPluginRegistrant.registerWith(flutterEngine)

        channel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "kr.or.kwater.ldm/sslvpn")

        channel.setMethodCallHandler { call, result ->

            if (call.method == "init") {
                Log.d("ssvpn", "init");

            } else if(call.method == "setVpnServer") {

                call.arguments.toString().split(",").let {
                    addr = it[0].trim().replace("[", "")
                    id = it[1].trim()
                    pwd = it[2].trim().replace("]", "")
                }

                Log.d("sslvpn", "setVpnServer > $addr, $id, $pwd")

            } else if(call.method == "requestOtp") {

                val requestRunnable = RequestRunnable()
                val requestThread = Thread(requestRunnable)
                requestThread.start()

            } else if (call.method == "sendOtp") {

                result.success(sendOtp(call.arguments.toString()))
                Log.d("sslvpn", "sendOtp > $otp")

            } else if (call.method == "vpnLogin") {

                otp = call.arguments.toString()
                val startRunnable = StartRunnable()
                val startThread = Thread(startRunnable)
                startThread.start()

            } else if (call.method == "vpnLogout") {

                val stopRunnable = StopRunnable()
                val stopThread = Thread(stopRunnable)
                stopThread.start()

                unbindService(mConnection)

            }
        }

    }

    fun init() {
        Log.d("sslvpn", "ssl vpn init..........");
        channel.invokeMethod("init", "connected")
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        init();
    }

    fun sendOtp(arguments: String): String {
        otp = arguments
        return otp
    }


    override fun onResume() {
        super.onResume()

        val intent = Intent().setAction("net.secuwiz.SecuwaySSLU.kwater21")
        intent.setPackage("net.secuwiz.SecuwaySSLU.kwater21")

        Log.d("sslvpn", "onResume")

        tempService = if (bindService(
                intent,
                mConnection,
                BIND_AUTO_CREATE or BIND_ALLOW_ACTIVITY_STARTS
            ) == true
        ) {
            //println("bindservice success")
            Log.d("sslvpn", "bindservice success")
            tempService
        } else {
            Log.d("sslvpn", "bindservice fail")
            null
        }

    }

    override fun onPause() {
        super.onPause()

        try {
            unbindService(mConnection)
        } catch (e: Exception) {
        }
    }

    class SecuwayServiceConnection : ServiceConnection {
        override fun onServiceConnected(name: ComponentName, service: IBinder) {
            //서비스 바인더  멤버변수로 저장
            Log.d("sslvpn", "onServiceConnected : $service")
            tempService = service
        }

        override fun onServiceDisconnected(name: ComponentName) {
        }
    }

    class StartRunnable : Runnable {
        // runOnUiThread 를 사용하기 위해 Runnable 을 사용
        override fun run() {
            //bindService 가 정상적으로 되고 onServiceConnected() 까지 호출된 다음 실행
            //서비스에 연결 되었으면 vpn 로그인
            if (tempService != null) {
            }

            val objAidl: IMobileApi = IMobileApi.Stub.asInterface(tempService)
            var strResult = "error"

            if (tempService != null) {

                Log.d("sslvpn", "StartRunnable $addr, $id, $pwd, $otp")

                try {
                    //OTP를 이용하여 vpn 시작
                    strResult = objAidl.OtpLogin(
                        addr,
                        id,
                        pwd,
                        otp,
                        true
                    )

                    if (strResult != null && strResult == "0") {
                        //"0" 이 리턴되면 연결 성공
                        //println("startvpn start")
                        Log.d("sslvpn", "startvpn start")

                        handler.post {
                            channel.invokeMethod("vpnStatus", "connected")
                        }

                    } else {
                        //"0" 이 아니면 에러 메시지
                        //println("startvpn error: $strResult")
                        Log.e("sslvpn", "startvpn error: $strResult")

                        handler.post {
                            channel.invokeMethod("vpnStatus", "error")
                        }
                    }
                } catch (e: RemoteException) {
                }
            }
        }
    }

    class StopRunnable : Runnable {
        override fun run() {
            //bindService 가 정상적으로 되고 onServiceConnected() 까지 호출된 다음 실행
            //서비스에 연결 되었으면 vpn 로그아웃
            if (tempService != null) {
                val objAidl: IMobileApi = IMobileApi.Stub.asInterface(tempService)

                try {
                    objAidl.StopVpn()
                    handler.post {
                        channel.invokeMethod("vpnLogout", "")
                    }

                    Log.d("sslvpn", "StopRunnable $addr, $id, $pwd")
                } catch (e: RemoteException) {
                }
            }
        }
    }

    class RequestRunnable : Runnable {
        override fun run() {

            var strResult = "error"

            //bindService 가 정상적으로 되고 onServiceConnected() 까지 호출된 다음 실행
            //서비스에 연결 되었으면 vpn 로그인
            if (tempService != null) {
                val objAidl: IMobileApi = IMobileApi.Stub.asInterface(tempService)

                try {

                    Log.d("sslvpn", "RequestRunnable $addr, $id, $pwd")

                    //인증 번호 요청을 함
                    strResult = objAidl.OtpRequest(
                        addr,
                        id,
                        pwd,
                        true
                    )

                    //인증 요청 결과
                    //정상적인 경우   "********* 인증번호가 발송되었습니다." 라는 메시지 나옴
                    println("RequestOtp result: $strResult")

                    handler.post {
                        channel.invokeMethod("sendOtp", strResult)
                    }

                } catch (e: RemoteException) {
                }
            }
        }
    }


}
