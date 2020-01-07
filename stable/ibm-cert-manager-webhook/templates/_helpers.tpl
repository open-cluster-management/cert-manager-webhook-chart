{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
Manually fix the 'app' and 'name' labels to 'webhook' to maintain
compatibility with the v0.9 deployment selector.
*/}}
{{- define "webhook.name" -}}
{{- printf "webhook" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "webhook.fullname" -}}
{{- $name := default (include "webhook.name" .) .Values.nameOverride -}}
{{- printf "cert-manager-%s" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "webhook.chart" -}}
{{- printf "%s-%s" (include "webhook.name" . ) .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "webhook.selfSignedIssuer" -}}
{{ printf "%s-selfsign" (include "webhook.fullname" .) }}
{{- end -}}

{{- define "webhook.rootCAIssuer" -}}
{{ printf "%s-ca" (include "webhook.fullname" .) }}
{{- end -}}

{{- define "webhook.rootCACertificate" -}}
{{ printf "%s-ca" (include "webhook.fullname" .) }}
{{- end -}}

{{- define "webhook.servingCertificate" -}}
{{ printf "%s-tls" (include "webhook.fullname" .) }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "webhook.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "webhook.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
