// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33639,y:32872,varname:node_3138,prsc:2|emission-2216-RGB;n:type:ShaderForge.SFN_NormalVector,id:3211,x:32332,y:32822,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:804,x:32569,y:32889,varname:node_804,prsc:2,dt:0|A-3211-OUT,B-7734-OUT;n:type:ShaderForge.SFN_LightVector,id:7734,x:32332,y:32980,varname:node_7734,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1597,x:32735,y:32959,varname:node_1597,prsc:2|A-804-OUT,B-4654-OUT;n:type:ShaderForge.SFN_Vector1,id:4654,x:32551,y:33090,varname:node_4654,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:5936,x:32735,y:33153,varname:node_5936,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:5690,x:32922,y:33036,varname:node_5690,prsc:2|A-1597-OUT,B-5936-OUT;n:type:ShaderForge.SFN_Append,id:3116,x:33056,y:33212,varname:node_3116,prsc:2|A-5690-OUT,B-6255-OUT;n:type:ShaderForge.SFN_Vector1,id:6255,x:32741,y:33320,varname:node_6255,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Tex2d,id:2216,x:33317,y:33205,ptovrint:False,ptlb:node_2216,ptin:_node_2216,varname:node_2216,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e6e7abfd01541984db62a8d677d6b2d7,ntxv:0,isnm:False|UVIN-3116-OUT;proporder:2216;pass:END;sub:END;*/

Shader "Shader Forge/lamber" {
    Properties {
        _node_2216 ("node_2216", 2D) = "white" {}
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _node_2216; uniform float4 _node_2216_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float2 node_3116 = float2(((dot(i.normalDir,lightDirection)*0.5)+0.5),0.2);
                float4 _node_2216_var = tex2D(_node_2216,TRANSFORM_TEX(node_3116, _node_2216));
                float3 emissive = _node_2216_var.rgb;
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _node_2216; uniform float4 _node_2216_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
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
