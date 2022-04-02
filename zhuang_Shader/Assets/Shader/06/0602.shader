// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34043,y:32561,varname:node_3138,prsc:2|emission-7911-OUT;n:type:ShaderForge.SFN_NormalVector,id:3923,x:32587,y:32730,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:1186,x:32362,y:32586,varname:node_1186,prsc:2;n:type:ShaderForge.SFN_Vector1,id:2760,x:32362,y:32719,varname:node_2760,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:6741,x:32587,y:32586,varname:node_6741,prsc:2|A-1186-OUT,B-2760-OUT;n:type:ShaderForge.SFN_ViewVector,id:3646,x:32842,y:32730,varname:node_3646,prsc:2;n:type:ShaderForge.SFN_Reflect,id:6479,x:32793,y:32586,varname:node_6479,prsc:2|A-6741-OUT,B-3923-OUT;n:type:ShaderForge.SFN_Dot,id:2849,x:33018,y:32586,varname:node_2849,prsc:2,dt:0|A-6479-OUT,B-3646-OUT;n:type:ShaderForge.SFN_LightVector,id:2145,x:32824,y:32967,varname:node_2145,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:5757,x:32859,y:33099,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:7111,x:33105,y:32959,varname:node_7111,prsc:2,dt:0|A-2145-OUT,B-5757-OUT;n:type:ShaderForge.SFN_Max,id:7979,x:33344,y:32959,varname:node_7979,prsc:2|A-7111-OUT,B-4572-OUT;n:type:ShaderForge.SFN_Vector1,id:4572,x:33195,y:33139,varname:node_4572,prsc:2,v1:0;n:type:ShaderForge.SFN_Add,id:7911,x:33781,y:32636,varname:node_7911,prsc:2|A-4620-OUT,B-1005-OUT;n:type:ShaderForge.SFN_Power,id:4620,x:33539,y:32585,varname:node_4620,prsc:2|VAL-4366-OUT,EXP-5509-OUT;n:type:ShaderForge.SFN_Slider,id:5509,x:33240,y:32781,ptovrint:False,ptlb:SpelurPow,ptin:_SpelurPow,varname:node_5509,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:30,max:90;n:type:ShaderForge.SFN_Max,id:4366,x:33259,y:32586,varname:node_4366,prsc:2|A-2849-OUT,B-5680-OUT;n:type:ShaderForge.SFN_Vector1,id:5680,x:33113,y:32731,varname:node_5680,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:1005,x:33586,y:32959,varname:node_1005,prsc:2|A-7979-OUT,B-8378-RGB;n:type:ShaderForge.SFN_Color,id:8378,x:33413,y:33139,ptovrint:False,ptlb:node_8378,ptin:_node_8378,varname:node_8378,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_TexCoord,id:8032,x:32646,y:33777,varname:node_8032,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_UVTile,id:448,x:32938,y:33845,varname:node_448,prsc:2|UVIN-8032-UVOUT,WDT-9348-OUT,HGT-9348-OUT,TILE-8881-OUT;n:type:ShaderForge.SFN_Vector1,id:8881,x:32646,y:33950,varname:node_8881,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:9348,x:32568,y:34154,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:node_9348,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:1;n:type:ShaderForge.SFN_Tex2d,id:8153,x:33176,y:33828,ptovrint:False,ptlb:node_8153,ptin:_node_8153,varname:node_8153,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1ed57e1ba278a7147b504c50feb33ca1,ntxv:0,isnm:False|UVIN-448-UVOUT;n:type:ShaderForge.SFN_Step,id:6360,x:33446,y:33842,varname:node_6360,prsc:2|A-8153-RGB,B-1973-OUT;n:type:ShaderForge.SFN_Slider,id:1973,x:33097,y:34007,ptovrint:False,ptlb:MaskRange,ptin:_MaskRange,varname:node_1973,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4,max:1;proporder:5509-8378;pass:END;sub:END;*/

Shader "Shader Forge/0602" {
    Properties {
        _SpelurPow ("SpelurPow", Range(0, 90)) = 30
        _node_8378 ("node_8378", Color) = (0.5,0.5,0.5,1)
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
                UNITY_DEFINE_INSTANCED_PROP( float, _SpelurPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_8378)
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
                float _SpelurPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpelurPow );
                float4 _node_8378_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_8378 );
                float3 emissive = (pow(max(dot(reflect((lightDirection*(-1.0)),i.normalDir),viewDirection),0.0),_SpelurPow_var)+(max(dot(lightDirection,i.normalDir),0.0)*_node_8378_var.rgb));
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
                UNITY_DEFINE_INSTANCED_PROP( float, _SpelurPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_8378)
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
