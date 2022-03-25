// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33185,y:32699,varname:node_3138,prsc:2|emission-7762-OUT;n:type:ShaderForge.SFN_LightVector,id:1504,x:31855,y:32932,varname:node_1504,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:3042,x:31871,y:33113,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:8730,x:32046,y:33020,varname:node_8730,prsc:2,dt:0|A-1504-OUT,B-3042-OUT;n:type:ShaderForge.SFN_Max,id:8285,x:32444,y:32961,varname:node_8285,prsc:2|A-8730-OUT,B-6834-OUT;n:type:ShaderForge.SFN_Vector1,id:6834,x:32169,y:33193,varname:node_6834,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:7610,x:32558,y:33110,ptovrint:False,ptlb:MainCol,ptin:_MainCol,varname:node_7610,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:8306,x:32479,y:32942,ptovrint:False,ptlb:SpecularPow,ptin:_SpecularPow,varname:node_8306,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:30,max:90;n:type:ShaderForge.SFN_ViewVector,id:3221,x:31691,y:32469,varname:node_3221,prsc:2;n:type:ShaderForge.SFN_LightVector,id:6294,x:31679,y:32637,varname:node_6294,prsc:2;n:type:ShaderForge.SFN_Add,id:2737,x:32116,y:32618,varname:node_2737,prsc:2|A-3221-OUT,B-6294-OUT;n:type:ShaderForge.SFN_NormalVector,id:1190,x:32215,y:32835,prsc:2,pt:False;n:type:ShaderForge.SFN_Normalize,id:7568,x:32307,y:32618,varname:node_7568,prsc:2|IN-2737-OUT;n:type:ShaderForge.SFN_Max,id:8833,x:32700,y:32671,varname:node_8833,prsc:2|A-6769-OUT,B-7091-OUT;n:type:ShaderForge.SFN_Vector1,id:6769,x:32468,y:32571,varname:node_6769,prsc:2,v1:0;n:type:ShaderForge.SFN_Dot,id:7091,x:32507,y:32684,varname:node_7091,prsc:2,dt:0|A-7568-OUT,B-1190-OUT;n:type:ShaderForge.SFN_Power,id:1270,x:32846,y:32727,varname:node_1270,prsc:2|VAL-8833-OUT,EXP-8306-OUT;n:type:ShaderForge.SFN_Multiply,id:1141,x:32824,y:32930,varname:node_1141,prsc:2|A-8285-OUT,B-7610-RGB;n:type:ShaderForge.SFN_Add,id:7762,x:32996,y:32801,varname:node_7762,prsc:2|A-1270-OUT,B-1141-OUT;n:type:ShaderForge.SFN_Vector1,id:361,x:31766,y:32798,varname:node_361,prsc:2,v1:-1;proporder:8306-7610;pass:END;sub:END;*/

Shader "Shader Forge/Lambert" {
    Properties {
        _SpecularPow ("SpecularPow", Range(0, 90)) = 30
        _MainCol ("MainCol", Color) = (1,1,1,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float _SpecularPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPow );
                float4 _MainCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainCol );
                float3 emissive = (pow(max(0.0,dot(normalize((viewDirection+lightDirection)),i.normalDir)),_SpecularPow_var)+(max(dot(lightDirection,i.normalDir),0.0)*_MainCol_var.rgb));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
