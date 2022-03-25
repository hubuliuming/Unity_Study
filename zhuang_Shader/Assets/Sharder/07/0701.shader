// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34411,y:32425,varname:node_3138,prsc:2|emission-9487-OUT;n:type:ShaderForge.SFN_NormalVector,id:9799,x:32479,y:32675,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:3567,x:32682,y:32675,cmnt:向上部分,varname:node_3567,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-9799-OUT;n:type:ShaderForge.SFN_Max,id:4132,x:32977,y:32722,varname:node_4132,prsc:2|A-3567-OUT,B-6649-OUT;n:type:ShaderForge.SFN_Vector1,id:6649,x:32832,y:32802,varname:node_6649,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:3231,x:32906,y:32901,cmnt:向下部分,varname:node_3231,prsc:2|A-3567-OUT,B-1845-OUT;n:type:ShaderForge.SFN_Vector1,id:1845,x:32703,y:32935,varname:node_1845,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:3776,x:33115,y:32974,varname:node_3776,prsc:2|A-3231-OUT,B-2734-OUT;n:type:ShaderForge.SFN_Vector1,id:2734,x:32927,y:33064,varname:node_2734,prsc:2,v1:0;n:type:ShaderForge.SFN_Subtract,id:150,x:33206,y:32770,varname:node_150,prsc:2|A-8669-OUT,B-4132-OUT;n:type:ShaderForge.SFN_Vector1,id:8669,x:33024,y:32591,varname:node_8669,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:4403,x:33430,y:32926,cmnt:得到中间部分,varname:node_4403,prsc:2|A-150-OUT,B-3776-OUT;n:type:ShaderForge.SFN_Color,id:5890,x:33310,y:32271,ptovrint:False,ptlb:UpCol,ptin:_UpCol,varname:node_5890,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:197,x:33310,y:32442,ptovrint:False,ptlb:midCol,ptin:_midCol,varname:_UpCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4,c2:0.4,c3:0.4,c4:1;n:type:ShaderForge.SFN_Color,id:6718,x:33310,y:32605,ptovrint:False,ptlb:DownCol,ptin:_DownCol,varname:_midCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:1881,x:33578,y:32270,varname:node_1881,prsc:2|A-5890-RGB,B-4132-OUT;n:type:ShaderForge.SFN_Multiply,id:9521,x:33597,y:32442,varname:node_9521,prsc:2|A-197-RGB,B-4403-OUT;n:type:ShaderForge.SFN_Multiply,id:6338,x:33597,y:32641,varname:node_6338,prsc:2|A-6718-RGB,B-3776-OUT;n:type:ShaderForge.SFN_Add,id:6169,x:33791,y:32389,varname:node_6169,prsc:2|A-1881-OUT,B-9521-OUT;n:type:ShaderForge.SFN_Add,id:9487,x:34028,y:32510,varname:node_9487,prsc:2|A-6169-OUT,B-6338-OUT;proporder:5890-197-6718;pass:END;sub:END;*/

Shader "Shader Forge/0701" {
    Properties {
        _UpCol ("UpCol", Color) = (1,1,1,1)
        _midCol ("midCol", Color) = (0.4,0.4,0.4,1)
        _DownCol ("DownCol", Color) = (0,0,0,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _UpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _midCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DownCol)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float3 normalDir : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _UpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _UpCol );
                float node_3567 = i.normalDir.g; // 向上部分
                float node_4132 = max(node_3567,0.0);
                float4 _midCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _midCol );
                float node_3776 = max((node_3567*(-1.0)),0.0);
                float3 node_6169 = ((_UpCol_var.rgb*node_4132)+(_midCol_var.rgb*((1.0-node_4132)-node_3776)));
                float4 _DownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DownCol );
                float3 node_6338 = (_DownCol_var.rgb*node_3776);
                float3 emissive = (node_6169+node_6338);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
